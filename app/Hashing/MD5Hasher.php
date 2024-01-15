<?php

namespace App\Hashing;

use Illuminate\Contracts\Hashing\Hasher;

class MD5Hasher implements Hasher
{
    /**
     * @inheritDoc
     */
    public function info($hashedValue)
    {
        return [
            'algo' => preg_match('/^[a-f0-9]{32}$/', $hashedValue),
            'algoName' => 'MD5',
            'options' => [],
        ];
    }

    /**
     * @inheritDoc
     */
    public function make($value, array $options = [])
    {
        return md5($value);
    }

    /**
     * @inheritDoc
     */
    public function check($value, $hashedValue, array $options = [])
    {
        return $this->make($value) === $hashedValue;
    }

    /**
     * @inheritDoc
     */
    public function needsRehash($hashedValue, array $options = [])
    {
        return ! $this->info($hashedValue)['algo'];
    }
}
