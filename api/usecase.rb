class UseCaseSample
    attr_accessor :feature
    def initialize
        puts "Creating usecases"
      end
    def createName
        return "Create#{@feature}.ts".strip
    end
    def createFile
        return "import { UseCaseResponse } from '../../../common/usecase/UseCaseResponse';
import { I#{@feature}, #{@feature}Model } from '../../model/#{@feature}';

export class Create#{@feature}UseCase {

    public async create(#{@feature.downcase} : I#{@feature}): Promise<UseCaseResponse> {

        let result = await new #{@feature}Model(#{@feature.downcase}).save()

        if (result.errors != null) {
            return new UseCaseResponse(false, result.errors.message);
        }
        else {
            return new UseCaseResponse(true, result);
        }
    }
}
"
      end
      def getName
        return "Get#{@feature}.ts".strip
    end
      def getFile
        return "import { #{@feature}Model, I#{@feature} } from '../../model/#{@feature}';

export class Get#{@feature}UseCase {

    async fetch() {
        return await #{@feature}Model.find().exec()
    }

    async get(id): Promise<I#{@feature}> {
        return await #{@feature}Model.findOne({ id: id }).exec()
    } 
}
"
      end
    def updateName
        return "Update#{@feature}.ts".strip
    end
      def updateFile
        return "import { I#{@feature}, #{@feature}Model } from '../../model/#{@feature}';

export class Update#{@feature}UseCase {
        
public async update(#{@feature.downcase}: I#{@feature}) {

    return await #{@feature}Model.findOneAndUpdate(
        {
            id: #{@feature.downcase}._id
        },
        {
            $set: {
                'example': #{@feature.downcase}.example,
            }
        }).exec();
    }
} 
"
    end
    def deleteName
      return "Delete#{@feature}.ts".strip
  end
    def deleteFile
      return "import { UseCaseResponse } from '../../../common/usecase/UseCaseResponse';
import { #{@feature}Model } from '../../model/#{@feature}';

export class Delete#{@feature}UseCase {

    public async delete(id: String) {

        let result = await #{@feature}Model.remove({ _id: id }).exec()

        if (result.errors != null) {
            return new UseCaseResponse(false, result.errors.message);
        }
        else {
            return new UseCaseResponse(true, result);
        }
    }
} 
"
    end
end 
