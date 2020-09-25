<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use function GuzzleHttp\Promise\task;

class TaskController extends Controller
{

    public function index()
    {
        $tasks = Task::with(['project'])->orderBy('priority')->where('user_id', Auth::id())->paginate(7);
        $projects = Project::where('user_id', Auth::id())->get()->all();
        return view('task.index', compact('tasks','projects'));
    }
    public function store()
    {

        $data = $this->valaidateTaskDetails() + ['project_id' => request('project_id'), 'user_id' => Auth::id()];
        Task::create($data);
        return back()->with('msg', 'Task Added Successfully');
    }

    public function update($id)
    {
        $data = $this->valaidateTaskDetails()  + ['project_id' => request('project_id')];
        Task::find($id)->update($data);
        return back()->with('msg', 'Task Updated Successfully');
    }

    public function destroy($id)
    {
        abort_if(Task::find($id) == null, 404);
        Task::whereId($id)->delete();
        return redirect('/task/index')->with('msg', 'Task Droped Successfully');
    }

    public function projectTasks($id)
    {
        $tasks= Task::orderBy('priority')->where('project_id', $id)->paginate(7);
        return view('task.project_tasks',compact('tasks'));
    }

    public function valaidateTaskDetails()
    {
        return  request()->validate(
            [
                'name' => "string|required",
                'priority' => "numeric|required",
                'project_id' => ""
            ]
        );
    }
}
