<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    // since i am explicitely validation each field, guarded is preferable over fillable
    protected $guarded = [];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
