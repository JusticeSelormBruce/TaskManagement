<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = Project::where('user_id', Auth::id())->paginate(7);
        return view('project.index', compact('projects'));
    }
    public function store()
    {
     
        $data = $this->valaidateProjectDetails()  + ['description'=>request('description'), 'user_id' => Auth::id()];
        Project::create($data);
        return back()->with('msg', 'Project Added Successfully');
    }

    public function update($id)
    {
        $data = $this->valaidateProjectDetails() +  ['description'=>request('description'), 'user_id' => Auth::id()];
        Project::find($id)->update($data);
        return back()->with('msg', 'Project Updated Successfully');
    }

    public function destroy($id)
    {
        abort_if(Project::find($id) == null, 404);
        Project::whereId($id)->delete();
        return redirect('/project/index')->with('msg', 'Project Droped Successfully');
    }

    public function valaidateProjectDetails()
    {
        return tap(
            request()->validate(
                [
                    'name' => "string|required",

                ]
            ),
            function () {
                if (request()->has('description')) {
                    return request()->validate(
                        [
                            'description' => "required|string"
                        ]
                    );
                } else {
                    return request()->validate(
                        [
                            'description' => ""
                        ]
                    );
                }
            }
        );
    }
}
