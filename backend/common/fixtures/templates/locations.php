<?php
/**
 * @var $faker \Faker\Generator
 */
return [
    'location_id' => $index + 1,
    'location_name' => $faker->country,
    'location_created_at' => $faker->date('Y-m-d H:i:s'),
    'location_updated_at' => $faker->date('Y-m-d H:i:s'),
];
