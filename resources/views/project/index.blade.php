@extends('app')
@section('render')
<style>
    a{
        text-decoration:none!important;
    }
</style>
<div class="container">
    <div class="row">
        <h1>Projects</h1> <span class="mx-3"><a class="btn text-primary btn-sm" href="/task/index">Tasks</a></span>
        <div class="ml-auto mx-5">@include('project.form')</div>
    </div>

<div class="row">

    @foreach ($projects as $item)
    <div class="col-lg-4 col-md-6 col-sm-12">
        <a href="/project/{{$item->id}}">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title text-primary">{{$item->name}}</h5>
                    <p class="card-text text-dark">{{$item->description}}</p>
                </div>
                <div class="card-footer">
                <div class="row">
                    <div class="ml-auto">
                        @include('project.edit')   <span class="mx-1"></span>@include('project.delete')
                    </div>
                </div>
                </div>
            </div>
         </a>
</div>
@endforeach

</div>
    

</div>
@endsection
