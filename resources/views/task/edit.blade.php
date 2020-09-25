<!-- Button trigger modal -->
<a type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModale{{$item->id}}">
edit
</a>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModale{{$item->id}}" tabindex="-1" aria-labelledby="exampleModalLabele{{$item->id}}" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabele{{$item->id}}">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="jumbotron">
                <form action="{{ route('task.update',['id' =>$item->id]) }}" method="Post" >
                    @method('PATCH')
                    @csrf
                    <div class="form-group">
                        <label for="">Task Name</label>
                        <input type="text" name="name" required value="{{ $item->name }}" class="form-control input-group-sm">
                        <div>{{ $errors->first('name') }}</div>
                    </div>
                    <div class="form-group">
                        <label for="">#Priority</label>
                        <input type="number" name="priority" required value="{{ $item->priority }}" class="form-control input-group-sm">
                        <div>{{ $errors->first('priority') }}</div>
                    </div>
                    <div>
                        <label for="">Add To Project</label>
                        <select name="project_id" id="" class="form-control input-group-sm">
                            @foreach ($tasks->groupBy('project_id') as $list)
                            @if ($list[0]->project == null)
                            @else
                            <option value="{{ $list[0]->project->id}}" @if ( $list[0]->project->id == $item->project_id) selected ?? "" @endif>{{ $list[0]->project->name}}</option>

                            @endif
                            @endforeach
                            <option value="">remove from project</option>
                        </select>
                    </div>
                    <div class="row pt-3">
                        <div class="mx-auto"> <button class="btn btn-primary btn-sm" type="submit"> <span
                                    class="mx-3">UPDATE</span></button></div>
                    </div>
                </form>
               </div>
        </div>
       
      </div>
    </div>
  </div>