<?php

namespace api\models;

class Servers extends \common\models\Servers
{
    /**
     * in case extra field need to send in response
     * @return array
     */
    public function fields()
    {
        return parent::fields();
    }

    /**
     * expand to fetch relative data
     * @return array
     */
    public function extraFields()
    {
        return array_merge(
            parent::extraFields(),
            [
                'serverLocation'
            ]
        );
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getServerLocation()
    {
        return $this->hasOne(\api\models\Locations::class, ['location_id' => 'server_location_id']);
    }
}
