<?php

namespace Tests\Feature;

use App\Models\Project;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProjectTest extends TestCase
{
   /** @test */
 
    public function a_user_can_create_Project()
    {
        $this->withoutExceptionHandling();
        $response = $this->post('/project', ['name' => 'School', 'description' => 'project description here','user_id'=>1]);
        $response->assertStatus(302);
        $response->assertSessionHas('msg');

    }

    /** @test */
    public function a_user_can_update_project()
    {
        $this->withoutExceptionHandling();
        $response  =  $this->patch(
            '/project/edit/' . Project::first()->id,
            ['name' => 'work', 'description' => 'project description*']
        );
        $response->assertStatus(302);
        $response->assertSessionHas('msg');
    }

    /** @test */
    public function a_user_can_delete_a_project()
    {
        $this->withoutExceptionHandling();
        $response =     $this->get('/project/delete/' . Project::first()->id);
        $response->assertStatus(302);
        $this->assertDatabaseMissing('projects',  [
            'name' => 'work'
        ]);
        $response->assertSessionHas('msg');
        $response->assertRedirect('project/index');

    }

    /** @test */
    public function taskIndex()
    {
         $this->withoutExceptionHandling();
         $response = $this->get('/project/index');
         $response->assertOk();
         $response->assertViewIs('project.index');
         $response->assertViewHas('projects');
    }
}
