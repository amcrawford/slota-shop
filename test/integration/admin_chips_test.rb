require "test_helper"

class AdminChipsTest < ActionDispatch::IntegrationTest

  def create_admin
    @admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
  end

  test "logged in admin sees chips index" do
    create_admin
    category_1 = Oil.create(name: "Lard")
    Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    visit admin_chips_path
    assert page.has_content?("All Chips")
    assert page.has_content?("Slotachips")
  end

  test "default user does not see admin categories index" do
    user = User.create(username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_chips_path
    refute page.has_content?("All Chips")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test "admin can edit chip" do
    create_admin
    category_1 = Oil.create(name: "Lard")
    Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_chips_path
    within "#slotachips" do
      click_link "Edit"
    end

    fill_in "Name", with: "EditedName"
    click_button "Update Chip"

    assert_equal admin_chips_path, current_path
    assert page.has_content? "EditedName"
  end

  test "admin cannot remove name from chip" do
    create_admin
    category_1 = Oil.create(name: "Lard")
    Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_chips_path
    within "#slotachips" do
      click_link "Edit"
    end

    fill_in "Name", with: ""
    click_button "Update Chip"

    assert page.has_content?("A chip must have a name")
  end

  test "admin can add chip" do
    create_admin
    category_1 = Oil.create(name: "Lard")
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_chips_path
    click_link "Add New Chip"
    fill_in "Name", with: "NewChip"
    fill_in "Price", with: 1.99
    fill_in "Description", with: "Coolest of the chips"
    click_button "Create Chip"

    assert admin_chips_path, current_path

    within(".chips") do
      assert page.has_content?("NewChip")
    end
  end

  test "admin cannot add chip without a name" do
    create_admin
    category_1 = Oil.create(name: "Lard")
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_chips_path
    click_link "Add New Chip"
    fill_in "Price", with: 1.99
    fill_in "Description", with: "Coolest of the chips"
    click_button "Create Chip"

    assert page.has_content?("A chip must have a name")
  end

  test "admin can delete chip" do
    create_admin
    create_shop
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_chips_path

    within("#slotachips") do
      click_link "Delete"
    end

    assert admin_chips_path, current_path

    within(".chips") do
      refute page.has_content?("Slotachips")
    end
  end
end
