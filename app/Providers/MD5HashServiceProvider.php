<?php

namespace App\Providers;

use App\Hashing\MD5Hasher;
use Hash;
use Illuminate\Support\ServiceProvider;

class MD5HashServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        Hash::extend('md5', function() {
            return new MD5Hasher();
        });
    }
}
