<!-- Button trigger modal -->
<a type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#exampleModald{{$item->id}}">
    drop
  </a>
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModald{{$item->id}}" tabindex="-1" aria-labelledby="exampleModalLabeld{{$item->id}}" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabeld{{$item->id}}">Delete Project</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="mx-auto">
                     <a  class="btn btn-danger " href="{{route('project.destroy',['id'=>$item->id ])}}" >Delete</a>
                         <span class="mx-2"></span>
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
                    
              
          
        </div>
      </div>
          </div>
         
        </div>
      </div>
    </div>