<?php

namespace App\Http\Middleware;

use App\Models\Company;
use App\Services\TenantConnectionService;
use Closure;
use Config;
use Illuminate\Http\Request;

class ChangeTenantConnectionMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        $domain = str_replace('.', '\.', config('app.domain'));

        preg_match('/(?<company>\w+)\.' . $domain . '/i', $request->host(), $match);

        if (isset($match['company'])) {
            TenantConnectionService::changeCompany($match['company']);
        }

        return $next($request);
    }
}
