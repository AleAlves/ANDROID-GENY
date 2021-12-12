class ControllerFacotry
    attr_accessor :feature
    def initialize
        puts 'Creating controller'
      end
    def name
        return "#{@feature}Controller.ts".strip
    end
    def file
        return "import { Request, Response } from 'express';
import { BaseController } from '../../common/controllers/BaseController'
import { #{@feature}Model } from './model/#{@feature}';
import { Create#{@feature}UseCase } from './usecase/Create#{@feature}'
import { Get#{@feature}UseCase } from './usecase/Get#{@feature}'
import { Delete#{@feature}UseCase } from './usecase/Delete#{@feature}'
import { OutputData } from '../../common/models/OutputData';
import { InputData } from '../../common/models/InputData';
import { Update#{@feature}UseCase } from './usecase/Update#{@feature}';
import { Exception } from '../../common/models/Exception';
import { HTTPStatus } from '../../common/models/HTTPStatus';

export class #{@feature}Controller extends BaseController {

    public async create(req: Request, res: Response) {

        let input = new InputData(req)
        let output = new OutputData(res)
        let #{@feature.downcase} = new #{@feature}Model()

        #{@feature.downcase}.example = input.data.#{@feature.downcase}.example 

        if (await super.validateBadRequest(res, #{@feature.downcase})) {
            return
        }

        let creation = await new Create#{@feature}UseCase().create(#{@feature.downcase})

        if (creation.error) {
            super.onError(res, new Exception(new HTTPStatus.SUCESS.OK))
            return
        }

        output.status = new HTTPStatus.SUCESS.CREATED
        super.send(output)
    }

    public async get(req: Request, res: Response) {

        let inputData = new InputData(req)
        let output = new OutputData(res)
        output.data = await new Get#{@feature}UseCase().get(inputData.query.id)
        super.send(output)
    }


    public async fetch(req: Request, res: Response) {

        let inputData = new InputData(req)
        let output = new OutputData(res)
        output.data = await new Gett#{@feature}UseCase().fetch()
        super.send(output)
    }

    public async update(req: Request, res: Response) {

        let inputData = new InputData(req)
        let output = new OutputData(res)

        let #{@feature.downcase} = new #{@feature}Model(inputData.data);

        if (await super.validateBadRequest(res, #{@feature.downcase})) {
            return
        }

        output.data = await new Update#{@feature}UseCase().update(#{@feature.downcase})
        super.send(output)
    }

    public async delete(req: Request, res: Response) {

        let input = new InputData(req)
        let output = new OutputData(res)

        let result = await new Delete#{@feature}UseCase().delete(input.query.id)

        if (result.error) {
            super.onError(res, new Exception(new HTTPStatus.SUCESS.OK))
            return
        }

        output.status = new HTTPStatus.SUCESS.CREATED
        super.send(output)
    }
}        
"
      end
end