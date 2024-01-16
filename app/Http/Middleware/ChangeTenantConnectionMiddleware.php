<?php

namespace App\Http\Middleware;

use App\Models\Company;
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
            $company = Company::where('schema_name', $match['company'])->first();

            $connection = config('database.connections.pgsql');
            $connection['search_path'] = $company->schema_name;

            if ($company->db_host) {
                preg_match('/^(?<host>[a-z0-9\.-]+):?(?<port>\d{1,4})?$/i', $company->db_host, $match);

                $connection['host']     = $match['host'];
                $connection['port']     = $match['port'] ?? $connection['port'];
                $connection['database'] = $company->db_name;
                $connection['username'] = $company->db_user;
                $connection['password'] = $company->db_pass;
            }

            Config::set('database.connections.' . $company->schema_name, $connection);
            Config::set('database.default', $company->schema_name);
        }

        return $next($request);
    }
}
