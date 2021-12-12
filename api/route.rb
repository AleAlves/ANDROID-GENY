class RoutesFactory
    attr_accessor :feature
    def initialize
        puts "Creating usecases"
      end
    def name
        return "#{@feature}Routes.ts".strip
    end
    def file
        return "import { Application } from 'express';
import { BaseRouter } from '../../common/controllers/BaseRouter'
import { #{@feature}Controller } from './#{@feature}Controller';

export class #{@feature}Routes extends BaseRouter {

    private app: Application
    private controller: #{@feature}Controller = new #{@feature}Controller();

    constructor(app: Application) {
        super();
        this.app = app
        this.get()
        this.fetch()
        this.create()
        this.update()
        this.delete()
    }

    //TODO add this.protected(), when needed

    private get() {
        this.app.route('/api/v1/#{@feature.downcase}').get(this.controller.get)
    }

    //TODO adjust the plural if needed

    private fetch() {
        this.app.route('/api/v1/#{@feature.downcase}s').get(this.controller.fetch)
    }

    private create() {
        this.app.route('/api/v1/#{@feature.downcase}').post(this.controller.create)
    }

    private update() {
        this.app.route('/api/v1/#{@feature.downcase}').put(this.controller.update)
    }

    private delete() {
        this.app.route('/api/v1/#{@feature.downcase}/:id').delete(this.controller.delete)
    }
}
"
    end
end 