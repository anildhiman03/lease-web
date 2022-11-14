<?php

namespace api\models;

use Yii;

class Locations extends \common\models\Locations
{
    public function fields()
    {
        $field = parent::fields();
        unset(
            $field['location_created_at'],
            $field['location_updated_at']
        );
        return $field;
    }
}
