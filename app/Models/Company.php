<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    protected $fillable = [
        'name',
        'schema_name',
        'db_host',
        'db_name',
        'db_user',
        'db_pass',
    ];
}
