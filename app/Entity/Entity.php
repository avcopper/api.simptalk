<?php

namespace Entity;

abstract class Entity
{
    protected function init(array $data, array $properties = [])
    {
        $fields = $properties ?: $this->getFields();

        foreach ($fields as $key => $field) {
            $prop = $field['field'];
            $type = $field['type'];

            if (isset($data[$key])) {
                switch ($type) {
                    case 'int':
                        $this->$prop = (int) $data[$key];
                        break;
                    case 'float':
                        $this->$prop = (float) $data[$key];
                        break;
                    case 'string':
                        $this->$prop = (string) $data[$key];
                        break;
                    case 'bool':
                        $this->$prop = (bool) $data[$key];
                        break;
                    case 'datetime':
                        $this->$prop = !empty($data[$key]) ? \DateTime::createFromFormat('Y-m-d H:i:s', $data[$key]) : null;
                        break;
                    default:
                        $this->$prop = $data[$key];
                        break;
                }
            }
        }

        return $this;
    }
}