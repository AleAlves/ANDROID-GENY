class ModelSample
    attr_accessor :feature
    def initialize
        puts "Creating model"
      end
    def name
        return "#{@feature}.ts"
    end
    def get
        return "import { Schema, model, ObjectId } from 'mongoose';

export interface I#{@feature} {
    _id: ObjectId
    example: number
}

export const #{@feature}Schema = new Schema<I#{@feature}>({
    example: {
        type: Number,
        required: true,
        default: 0
    }
});

export const #{@feature}Model = model<I#{@feature}>('#{@feature}', #{@feature}Schema)

export function map#{@feature}(input): I#{@feature} {
    let model = new #{@feature}Model()
    model.example = input.example
    return model
}
"
      end
end