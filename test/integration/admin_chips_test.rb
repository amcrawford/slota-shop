require "test_helper"

class AdminChipsTest < ActionDispatch::IntegrationTest

  def create_admin
    @admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
  end

  test 'logged in admin sees chips index' do
    create_admin
    category_1 = Oil.create(name: "Lard")
    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    visit admin_chips_path
    assert page.has_content?("All Chips")
    assert page.has_content?("Slotachips")
  end

  test 'default user does not see admin categories index' do
    user = User.create(username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_chips_path
    refute page.has_content?("All Chips")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test 'admin can edit chip' do
    create_admin
    category_1 = Oil.create(name: "Lard")
    item_1 = Chip.create(name: "Slotachips", price: 20, description: "Super yummy", oil_id: category_1.id)
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_chips_path
    within '#slotachips' do
      click_link 'Edit'
    end

    fill_in 'Name', with: 'EditedName'
    click_button 'Update Chip'

    assert_equal admin_chips_path, current_path
    assert page.has_content? 'EditedName'
  end
end
