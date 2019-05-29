require "application_system_test_case"

class EnvironmentsTest < ApplicationSystemTestCase
  setup do
    @environment = environments(:one)
  end

  test "visiting the index" do
    visit environments_url
    assert_selector "h1", text: "Environments"
  end

  test "creating a Environment" do
    visit environments_url
    click_on "New Environment"

    fill_in "Db url", with: @environment.db_url
    fill_in "Db user", with: @environment.db_user
    fill_in "Git hub release", with: @environment.git_hub_release
    fill_in "Name", with: @environment.name
    fill_in "Url", with: @environment.url
    fill_in "Version", with: @environment.version
    click_on "Create Environment"

    assert_text "Environment was successfully created"
    click_on "Back"
  end

  test "updating a Environment" do
    visit environments_url
    click_on "Edit", match: :first

    fill_in "Db url", with: @environment.db_url
    fill_in "Db user", with: @environment.db_user
    fill_in "Git hub release", with: @environment.git_hub_release
    fill_in "Name", with: @environment.name
    fill_in "Url", with: @environment.url
    fill_in "Version", with: @environment.version
    click_on "Update Environment"

    assert_text "Environment was successfully updated"
    click_on "Back"
  end

  test "destroying a Environment" do
    visit environments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Environment was successfully destroyed"
  end
end
