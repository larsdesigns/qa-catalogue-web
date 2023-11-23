<?php

namespace Utils;

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Handler\ErrorLogHandler;


class Configuration {
  private array $configuration;
  private string $id;
  /**
   * @var string|null
   */
  private ?string $catalogue;
  private bool $multitenant = false;
  private bool $displayNetwork;
  private bool $displayShacl;
  private bool $versioning;
  /**
   * @var string
   */
  private ?string $dir;
  /**
   * @var bool|mixed
   */
  private bool $showAdvancedSearchForm;
  /**
   * @var string|null
   */
  private ?string $mainSolrEndpoint;
  /**
   * @var string|null
   */
  private ?string $solrForScoresUrl;
  /**
   * @var string|null
   */
  private ?string $indexName;
  /**
   * @var string
   */
  private string $dirName;
  /**
   * @var string
   */
  private string $templates;
  /**
   * @var string
   */
  private string $defaultTab;
  /**
   * @var string|null
   */
  private ?string $label;
  /**
   * @var string|null
   */
  private ?string $url;
  /**
   * @var string|null
   */
  private ?string $schema;
  /**
   * @var string|null
   */
  private ?string $language;
  /**
   * @var string|null
   */
  private ?string $linkTemplate;
  /**
   * @var string
   */
  private string $logFile;
  private int $logLevel;

  public function __construct(array $configuration, string $id) {
    $this->configuration = $configuration;
    $this->id = $id;
    $this->initialize();
  }

  private function initialize() {
    $this->multitenant = $this->configuration['multitenant'] ?? false;
    $this->dir = $this->configuration['dir'] ?? null;

    // $this->displayNetwork = isset($this->configuration['display-network']) && (int) $this->configuration['display-network'] == 1;
    // $this->displayShacl = isset($this->configuration['display-shacl']) && (int) $this->configuration['display-shacl'] == 1;
    $this->catalogue = $this->getValue('catalogue', $this->id);
    $this->defaultTab = $this->getValue('default-tab', 'issues');
    $this->indexName = $this->getValue('indexName', $this->id);
    $this->dirName = $this->getValue('dirName', $this->id);
    $this->versioning = $this->getValue('versions', false);
    $this->displayNetwork = $this->getValue('display-network', false);
    $this->displayShacl = $this->getValue('display-shacl', false);
    $this->templates = $this->getValue('templates', 'config');
    $this->mainSolrEndpoint = $this->getValue('mainSolrEndpoint', 'http://localhost:8983/solr/');
    $this->solrForScoresUrl = $this->getValue('solrForScoresUrl', null);
    $this->showAdvancedSearchForm = $this->getValue('showAdvancedSearchForm', false);

    // logging internals, not made available outside of this class
    $this->logFile = $this->getValue('logFile', 'logs/qa-catalogue.log');
    $this->logHandler = $this->getValue('logHandler', 'error_log');
    $this->logLevel = Logger::toMonologLevel($this->getValue('logLevel', 'WARNING'));

    // for the Catalogue class configuration
    $this->label = $this->getValue('label', null);
    $this->url = $this->getValue('url', null);
    $this->schema = $this->getValue('schema', null); // 'MARC21'
    $this->linkTemplate = $this->getValue('linkTemplate', null);
    $this->language = $this->getValue('language', null); // 'en'
  }

  private function getValue($key, $defaultValue) {
    if ($this->multitenant) {
      $value = $this->getMultitenantValue($key, $defaultValue);
    } else {
      $value = $this->configuration[$key] ?? $defaultValue;
    }
    return $value;
  }

  private function getMultitenantValue($key, $defaultValue) {
    // error_log($key . ': ' . gettype($this->{$key}));
    if (isset($this->configuration[$key]) && isset($this->configuration[$key][$this->id])) {
      $value = $this->configuration[$key][$this->id];
    } else if (isset($this->configuration[$key]) && is_scalar($this->configuration[$key])) {
      $value = $this->configuration[$key];
    } else {
      $value = $defaultValue;
    }
    return $value;
  }

  public function getCatalogue(): ?string {
    return $this->catalogue;
  }

  public function isMultitenant(): bool {
    return $this->multitenant;
  }

  public function getDir(): ?string {
    return $this->dir;
  }

  public function doDisplayNetwork(): bool {
    return $this->displayNetwork;
  }

  public function doDisplayShacl(): bool {
    return $this->displayShacl;
  }

  public function doVersioning(): bool {
    return $this->versioning;
  }

  public function doShowAdvancedSearchForm(): bool {
    return $this->showAdvancedSearchForm;
  }

  public function getMainSolrEndpoint(): string {
    return $this->mainSolrEndpoint;
  }

  public function getSolrForScoresUrl(): ?string {
    return $this->solrForScoresUrl;
  }

  public function getIndexName(): string {
    return $this->indexName;
  }

  public function getDirName(): string {
    return $this->dirName;
  }

  public function getTemplates(): string {
    return $this->templates;
  }

  public function getDefaultTab(): string {
    return $this->defaultTab;
  }

  public function getLabel(): ?string {
    return $this->label;
  }

  public function getUrl(): ?string {
    return $this->url;
  }

  public function getSchema(): ?string {
    return $this->schema;
  }

  public function getLanguage(): ?string {
    return $this->language;
  }

  public function getLinkTemplate(): ?string {
    return $this->linkTemplate;
  }

  public function createLogger($name): Logger {
    $logger = new Logger($name);
    if ($this->logHandler === "file") {
      $logger->pushHandler(new StreamHandler($this->logFile, $this->logLevel));
    } else {
      $logger->pushHandler(new ErrorLogHandler(ErrorLogHandler::OPERATING_SYSTEM, $this->logLevel));
    }
    return $logger;
  }

}
