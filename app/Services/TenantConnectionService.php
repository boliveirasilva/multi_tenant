<?php

namespace App\Services;

use App\Models\Company;
use DB;
use Illuminate\Support\Facades\Config;

class TenantConnectionService
{
    protected Company $company;

    protected array $tenant_connection;

    public function setTenantDefaultConnection(string $value): self
    {
        $this->company = Company::where('schema_name', $value)->first();

        $this->createConnection();

        Config::set('database.default', $this->company->schema_name);

        session()->put('company', $this->company->schema_name);

        return $this;
    }

    public function reconnect(string $value)
    {
        if (empty($this->tenant_connection)) {
            $this->setTenantDefaultConnection($value);
        }

        DB::reconnect($value);
    }

    public static function changeCompany(string $value): self
    {
        return (new static())->setTenantDefaultConnection($value);
    }

    private function createConnection(): void
    {
        $connection = config('database.connections.pgsql');
        $connection['search_path'] = $this->company->schema_name;

        if ($this->company->db_host) {
            preg_match('/^(?<host>[a-z0-9.-]+):?(?<port>\d{1,4})?$/i', $this->company->db_host, $match);

            $connection['host']     = $match['host'];
            $connection['port']     = $match['port'] ?? $connection['port'];
            $connection['database'] = $this->company->db_name;
            $connection['username'] = $this->company->db_user;
            $connection['password'] = $this->company->db_pass;
        }

        $this->tenant_connection = $connection;
        Config::set('database.connections.' . $this->company->schema_name, $connection);
    }
}
