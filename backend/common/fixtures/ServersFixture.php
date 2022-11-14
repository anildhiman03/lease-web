<?php
namespace common\fixtures;

use yii\test\ActiveFixture;

class ServersFixture extends ActiveFixture
{
    public $modelClass = 'common\models\Servers';
    public $depends = [
        'common\fixtures\LocationsFixture'
    ];
}
