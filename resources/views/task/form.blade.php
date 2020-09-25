<!-- Button trigger modal -->
<button type="button" class="btn text-info" data-toggle="modal" data-target="#exampleModalg">
    Add Task
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalg" tabindex="-1" aria-labelledby="exampleModalLabelg" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelg">Add New Task</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
               <div class="jumbotron">
                <form action="{{ route('task.store') }}" method="Post" >
                    @csrf
                    <div class="form-group">
                        <label for="">Task Name</label>
                        <input type="text" name="name" required value="{{ old('name') }}" class="form-control input-group-sm">
                        <div>{{ $errors->first('name') }}</div>
                    </div>
                    <div class="form-group">
                        <label for="">#Priority</label>
                        <input type="text" name="priority" required value="{{ old('priority') }}" class="form-control input-group-sm">
                        <div>{{ $errors->first('priority') }}</div>
                    </div>
                    <div>
                        <select name="project_id" id="" class="form-control input-group-sm">
                            <option value="">Select Project</option>
                            @foreach ($projects as $item)
                           
                          <option value="{{ $item->id}}">{{ $item->name}}</option>
                         
                            @endforeach
                           
                        </select>
                    </div>
                    <div class="row pt-3">
                        <div class="mx-auto"> <button class="btn btn-primary btn-sm" type="submit"> <span
                                    class="mx-3">Save</span></button></div>
                    </div>
                </form>
               </div>
            </div>

        </div>
    </div>
</div>
