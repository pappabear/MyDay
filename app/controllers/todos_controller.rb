class TodosController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_todo, only: [:show, :edit, :update, :destroy]


  def today
    session[:working_date] = Date.today.strftime("%m/%d/%Y")
    @todo = Todo.new
    @todos = Todo.where('(is_complete is null and due_date<?) or (due_date=?)', Date.today, Date.today)
    session[:path] = 'Today'
  end


  def new
    @todo = Todo.new
    @todo.due_date = session[:working_date] #Date.today.strftime("%m/%d/%Y")
  end


  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html {
          flash[:success] = "Todo was successfully created."
          @todos = determine_todos_as_determined_by_working_date
          redirect_to today_path
        }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end

  end


  def edit
    @todo.due_date = @todo.due_date.strftime("%m/%d/%Y") unless @todo.due_date.nil?
  end


  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    if params[:todo]['is_complete'].nil?
      @todo.is_complete = nil
    else
      @todo.is_complete = true
    end

    respond_to do |format|
      if @todo.save
        format.html {
          flash[:success] = "Todo was successfully updated."
          @todos = determine_todos_as_determined_by_working_date
          redirect_to today_path
        }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end

  end


  def mark_complete
    @item = Todo.find(params[:id])

    if @item.recurrence > 0
      @new_item = Todo.new
      @new_item.subject = @item.subject
      @new_item.recurrence = @item.recurrence

      if @new_item.recurrence == 1
        @new_item.due_date = @item.due_date.advance(:days=>1)
      elsif @new_item.recurrence == 2
        @new_item.due_date = @item.due_date.advance(:weeks=>1)
      elsif @new_item.recurrence == 3
        @new_item.due_date = @item.due_date.advance(:weeks=>2)
      else
        @new_item.due_date = @item.due_date.advance(:months=>1)
      end
      @new_item.save!
    end

    @item.update_attribute('is_complete', true)
    @item.save!
    @todos = determine_todos_as_determined_by_working_date
  end


  def mark_incomplete
    @item = Todo.find(params[:id])
    @item.update_attribute('is_complete', nil)
    @item.save!
    @todos = determine_todos_as_determined_by_working_date
  end


  def skip
    @todo = Todo.find(params[:id])

    if @todo.recurrence <= 1
      newDate = @todo.due_date.to_date.advance(:days=>1)
    elsif @todo.recurrence == 2
      newDate = @todo.due_date.to_date.advance(:weeks=>1)
    elsif @todo.recurrence == 3
      newDate = @todo.due_date.to_date.advance(:weeks=>2)
    else
      newDate = @todo.due_date.to_date.advance(:months=>1)
    end

    @todo.update_attribute('due_date', newDate)
    @todo.save

    @todos = determine_todos_as_determined_by_working_date
    redirect_to today_path
  end


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    @todos = determine_todos_as_determined_by_working_date
    redirect_to today_path
  end


=begin
  def sort
    # puts 'sort params=' + params['item'].to_s
    @todos = Todo.where('id in (?)', params['item'])

    @todos.each do |w|
      w.position = params['item'].index(w.id.to_s) + 1
      w.save!
    end

    render :nothing => true
  end
=end


  def tomorrow
    session[:working_date] = Date.tomorrow.strftime("%m/%d/%Y")
    @todo = Todo.new
    @todos = Todo.where('due_date=?', Date.tomorrow)
    session[:path] = 'Tomorrow'
  end


  def someday
    @todo = Todo.new
    @todos = Todo.where('due_date IS NULL')
    session[:path] = 'Someday'
  end


  def index

    if params['d'].nil? || params['d'] == ''
      redirect_to today_path
    end

    @todo = Todo.new
    @todos = Todo.where('due_date=?', params['d'])
  end



  def todo_params
    params.require(:todo).permit(:subject, :due_date, :is_complete, :recurrence, :id)
  end


  private


  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end


  def determine_todos_as_determined_by_working_date
    #puts '>>>>> session[:working_date]=' + session[:working_date]
    b = session[:working_date].split('/')
    s = b[2] + '-' + b[0] + '-' + b[1]
    #puts '>>>>> s=' + s
    d = s.to_date
    #puts ' Converted date then is ' + d.to_s
    todos = Todo.where('due_date=?', d)
    #--- determine which day's todos to return
    if session[:working_date] == Date.today.strftime("%m/%d/%Y")
      todos =  Todo.where('(is_complete is null and due_date<?) or (due_date=?)', Date.today, Date.today)
    elsif session[:working_date] = Date.tomorrow.strftime("%m/%d/%Y")
      todos = Todo.where('due_date=?', Date.today+1)
    end
    return todos
  end


  # def calculate_percent_complete(todos)
  #
  #   n = todos.count
  #   done = 0.0
  #   undone = 0.0
  #   p = 0.0
  #
  #   if n == 0
  #     return 0
  #   end
  #
  #   todos.each do |t|
  #     if t.is_complete?
  #       done += 1.0
  #     else
  #       undone += 1.0
  #     end
  #   end
  #
  #   if done == n
  #     return 100
  #   end
  #
  #   if undone == 0
  #     return 0
  #   end
  #
  #   p = (((done/n).to_f)*100).to_i
  #   # puts 'p=' + p.to_s
  #   return p
  #
  # end


  def fix_date_format(raw_date_string)
    date_buffer = raw_date_string.split('/')
    return date_buffer[2] + '-' + date_buffer[0] + '-' + date_buffer[1]
  end


  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You have to be a registered user to do that. It's easy to <a href='/signup' style='color:black;'>join</a>!"
      redirect_to login_url
    end
  end


end
