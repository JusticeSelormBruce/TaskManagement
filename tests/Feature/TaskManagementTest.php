<?php

namespace Tests\Feature;

use App\Models\Task;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TaskManagementTest extends TestCase
{
    /** @test */
    public function a_user_can_create_task()
    {
        $this->withoutExceptionHandling();
        $response = $this->post('/task', ['name' => 'go for interview at 5 pm', 'priority' => 1,'user_id'=>1]);
        $response->assertStatus(302);
        $response->assertSessionHas('msg');
    }

    /** @test */
    public function a_user_can_update_task()
    {
        $this->withoutExceptionHandling();
        $response  =  $this->patch(
            '/task/edit/' . Task::first()->id,
            ['name' => 'go for interview at 5 pm *', 'priority' => 1,'user_id'=>1,'project_id'=>2]
        );
        $response->assertStatus(302);
        $response->assertSessionHas('msg');
    }

    /** @test */
    public function a_user_can_delete_a_task()
    {
        $this->withoutExceptionHandling();
        $response =     $this->get('/task/delete/' . Task::first()->id);
        $response->assertStatus(302);
        $this->assertDatabaseMissing('tasks',  [
            'name' => 'go for interview at 5 pm *'
        ]);
        $response->assertSessionHas('msg');
        $response->assertRedirect('task/index');

    }

    /** @test */
    public function taskIndex()
    {
         $this->withoutExceptionHandling();
         $response = $this->get('/task/index');
         $response->assertOk();
         $response->assertViewIs('task.index');
         $response->assertViewHas('tasks');
    }
    
}
