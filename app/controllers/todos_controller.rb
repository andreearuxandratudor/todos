class TodosController < ApplicationController

        def new
          @users = User.all
        end

        def index
            @users = User.all
            # Aici luati toate todo-urile din baza de date si le asignati variabilei @todos
            #if(params[:q].nil?)
            #    @todos = Todo.all
            #else
            #    @todos = Todo.where("title like ?", "%#{params[:q]}%")
            #end
            if params[:user_id]
              @user = User.find(params[:user_id])
              @todos = @user.todos
            else
               @todos = Todo.all
            end

            if params[:q]
              @todos = @todos.where(…)
            end
        end


          def create
               # Cream un obiect de tip Todo si ii asignam datele din formular. Momentan acest obiect exista doar in memorie
               todo = Todo.new(:title => params[:title])

              todo.user_id = params[:user_id]
              # Aici salvam todo-ul in baza de date
               if todo.save
                    # Mesajul de aici poate fi accesat in app/views/projects/index.html.erb
                    flash[:notice] = "Todo was saved successfully"
               else
                   flash[:notice] = "Todo was not saved"
               end

               redirect_to "/todos"
          end

          def delete
            @todo = Todo.find params[:todo_id]
            @todo.destroy
            redirect_to "/todos"
          end
end
