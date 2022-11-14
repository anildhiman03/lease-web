<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[Servers]].
 *
 */
class ServersQuery extends \yii\db\ActiveQuery
{
    /**
     * @param null $db
     * @return array|\yii\db\ActiveRecord[]
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @param null $db
     * @return array|null|\yii\db\ActiveRecord
     */
    public function one($db = null)
    {
        return parent::one($db);
    }

    /**
     * filter by server model name
     * @param $title
     * @return ServersQuery
     */
    public function filterByName($title) {
        return $this->andFilterWhere(['like', 'server_model', $title]);
    }

    /**
     * filter by location
     * @param $location
     * @return ServersQuery
     */
    public function filterByLocation($location) {
        return $this->andFilterWhere(['server_location_id' => $location]);
    }

    /**
     * filter by hard disk type
     * @param $HDType
     * @return ServersQuery
     */
    public function filterByHardDiskType($HDType) {
        return $this->andFilterWhere(['server_hard_disk_type' => $HDType]);
    }

    /**
     * filter by storage
     * @param $storage
     * @return ServersQuery
     */
    public function filterByHardStorage($storage) {
        return $this->andFilterWhere(['server_hard_disk_space' => $storage]);
    }

    /**
     * filter by ram
     * @param $ram
     * @return ServersQuery
     */
    public function filterByRam($ram) {
        return $this->andFilterWhere(['server_ram' => $ram]);
    }
}
