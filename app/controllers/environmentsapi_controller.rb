class EnvironmentsapiController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

  # GET /environments/1
  # GET /environments/1.json
  def show
  end

  # PATCH/PUT /environmentsByName
  # PATCH/PUT /environmentsByName.json
  def updateByName
    
    ENV['WEB_HOOK_KEY'] || raise('no WEB_HOOK_KEY configured')
    
    environment_params
   
    respond_to do |format|
      
      if params["web_hook_key"] != ENV['WEB_HOOK_KEY']
        format.json { render json: {}, status: :unauthorized }
      else
        @environment = Environment.find_by name: params["environment"]["name"]
        if @environment.update(environment_params)
          format.html { redirect_to @environment, notice: 'Environment was successfully updated.' }
          format.json { render :show, status: :ok, location: @environment }
        else
          format.html { render :edit }
          format.json { render json: @environment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_params
      params.require(:web_hook_key)
      params.require(:environment).permit(:name, :version, :git_hub_release, :url, :db_url, :db_user)
    end
end
