@extends('app')
@section('render')
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#draggable" ).draggable();
} );
</script>
    <div class="container">

        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-12">
              <div class="row">
                <div class="ml-5 pl-3">@include('project.form')</div>
              </div>
                <div class="dropdown">
                    <button id="my-dropdown" class="btn  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"> <span class="mx-lg-5 mx-md-5 mx-sm-0">Projects</span></button>
                    <div class="dropdown-menu" aria-labelledby="my-dropdown">
                        @foreach ($projects as $item)
                          
                                <a class="dropdown-item" href="/project/{{ $item->id}}" class="w"> <span
                                        class="mx-2">{{ $item->name }}</span></a>
                         

                        @endforeach

                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12">
             
                <ul class="list-group" draggable="true" >
                    @foreach ($tasks as $item)
                        <li class="list-group-item py-2 bg-default" >
                            <div class="row">{{ $item->name }} <span class="ml-auto mx-2">#{{ $item->priority }}</span>
                                @include('task.edit') <span class="mx-2">@include('task.delete')</span></div>
                        </li>

                    @endforeach
                  
                </ul>
              
              <div class="row pt-3"> 
                  <div class="ml-auto mx-5">
                   <small> {{$tasks->links()}}</small>
                  </div>
              </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-12">
                <div class="row">
                    <div class="mx-auto">
                        @include('task.form')
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
  $('.sortable').sortable();
</script>
@endsection
