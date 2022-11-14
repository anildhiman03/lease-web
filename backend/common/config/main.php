<?php
return [
    'name' => 'LeaseWeb',
    'timeZone' => 'Asia/Kolkata',
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'language' => 'en', // <- here!
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'httpclient' => [
            'class' =>'yii\httpclient\Client',
        ],
        'user' => [
            'identityClass' => 'candidate\models\Candidate',
            'enableAutoLogin' => false,
            'enableSession' => false,
            'loginUrl' => null
        ],
    ],
];
