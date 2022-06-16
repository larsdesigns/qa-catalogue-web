<?php


abstract class Catalogue {

  protected $name;
  protected $label;
  protected $url;
  protected $schemaType = 'MARC21';
  protected $marcVersion = 'MARC21';
  protected $position = 3;
  public static $supportedTypes = [
    'Books', 'Computer Files', 'Continuing Resources', 'Maps', 'Mixed Materials', 'Music', 'Visual Materials', 'all'
  ];


  abstract function getOpacLink($id, $record);

  public function getName() {
    return $this->name;
  }

  public function getLabel() {
    return $this->label;
  }

  public function getUrl() {
    return $this->url;
  }

  /**
   * @return string
   */
  public function getSchemaType(): string {
    return $this->schemaType;
  }


  public function getMarcVersion() {
    return $this->marcVersion;
  }

  /**
   * @return int
   */
  public function getPosition(): int {
    return $this->position;
  }

  public function getTag(string $input): string {
    return substr($input, 0, 3);
  }

  public function getSubfield(string $input): string {
    return substr($input, 3);
  }
}