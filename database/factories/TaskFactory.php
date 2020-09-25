<?php

namespace Database\Factories;

use App\Models\Task;
use Illuminate\Database\Eloquent\Factories\Factory;

class TaskFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Task::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'priority' => $this->faker->numberBetween(1, 10),
            'project_id' => $this->faker->numberBetween(1, 5),
            'user_id' => $this->faker->numberBetween(1, 10),
        ];
    }
}
