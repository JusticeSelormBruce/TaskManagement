<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;
use App\Models\Task;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return Inertia\Inertia::render('Dashboard');
})->name('dashboard');



// Project Controller Route Logic
Route::post('/project',[ProjectController::class, 'store'])->name('project.store');
Route::patch('project/edit/{id}',[ProjectController::class, 'update'])->name('project.update');
Route::get('project/delete/{id}',[ProjectController::class, 'destroy'])->name('project.destroy');
Route::get('project/index',[ProjectController::class, 'index'])->name('project.index');

// Task Controller Route Logic
Route::post('/task',[TaskController::class, 'store'])->name('task.store');
Route::patch('task/edit/{id}',[TaskController::class, 'update'])->name('task.update');
Route::get('task/delete/{id}',[TaskController::class, 'destroy'])->name('task.destroy');
Route::get('task/index',[TaskController::class, 'index'])->name('task.index');


Route::get('/project/{id}',[TaskController::class,'projectTasks']);