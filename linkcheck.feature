Feature: Check for dead links
  Scenario Outline: Launch App
    # There are some page requests that we are not interested in verifying.
    # These requests are blocked with a 201 to make them seem like they were successful.
    Given I block access to the URL regex ".*?realtime\.services\.disqus\.com.*" with response "201"
    And I block access to the URL regex ".*?semver\.org.*" with response "201"
    And I block access to the URL regex ".*?img\.youtube\.com.*" with response "201"
    And I block access to the URL regex ".*?apis\.google\.com.*" with response "201"
    And I block access to the URL regex ".*?accounts\.google\.com.*" with response "201"
	  And I block access to the URL regex ".*?favicon\.ico$" with response "201"
    And I block access to the URL regex ".*?pippio.com.*" with response "201"
    And I block access to the URL regex ".*?static.jboss.org.*\.png" with response "201"
    And I block access to the URL regex ".*?www.jboss.org.*?\.png" with response "201"
    And I block access to the URL regex ".*?jbossremoting.jboss.org.*\.png" with response "201"
    And I block access to the URL regex "http://jbossremoting\.jboss\.org/dms/content/common/.*" with response "201"
    And I block access to the URL regex ".*?customer-context-gateway.atlassian.com.*" with response "201"
    And I block access to the URL regex "https://octopus\.com/img/layout/logo-2x\.png" with response "201"
    And I open the page "<url>"
    Then I open all links in new tabs and then close the tabs
    And I verify that there were no HTTP errors
    Examples:
    | url |
    |  https://octopus.com/docs/deploying-applications/deploy-java-applications   |
    |  https://octopus.com/docs/api-and-integration/bamboo/bamboo-plugin  |
