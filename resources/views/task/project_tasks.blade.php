@extends('app')
@section('render')
    <div class="container">
        <div class="row py-2">

            <div class="ml-auto mx-5">
                <a href="{{route('project.index')}}" class="btn btn-primary btn-sm">My Projects</a>
            </div>
        </div>
        <div class="alert alert-secondary py-1" role="alert">
         
          <div class="row">
         <a href="/task/index" class="text-primary">Main Menu</a> <span class="mr-5"></span>  </span>
            <div class="ml-auto">
           <span class="mx-2 badge text-success bg-dark">Total task in Project <span class="mx-2">{{$tasks->total()}}</span></span>
            </div>
          </div>
         
        </div>
        <ul class="list-group">
            @foreach ($tasks as $item)
                <li class="list-group-item py-2 bg-default sortable">
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
@endsection
