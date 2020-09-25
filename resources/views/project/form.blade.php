
<!-- Button trigger modal -->
<a type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
Add Project  </a>
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Project</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="jumbotron">
                <form action="{{ route('project.store') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="">Project Name</label>
                        <input type="text" name="name" required value="{{ old('name') }}"
                            class="form-control input-group-sm">
                        <div>{{ $errors->first('name') }}</div>
                    </div>
                    <div class="form-group">
                        <label for="">Description</label>
                        <textarea name="description" id="" cols="30" rows="3" class="form-control"></textarea>
                        <div>{{ $errors->first('description') }}</div>
                    </div>
                    <div class="row">
                        <div class="mx-auto">
                            <button class="btn btn-primary btn-sm" type="submit"> save</button>
                        </div>
                    </div>
                </form>
              </div>
          </div>
         
        </div>
      </div>
    </div>
