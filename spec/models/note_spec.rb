require 'rails_helper'

RSpec.describe Note, type: :model do
  it "returns notes that match the search term" do
    user = User.create(
      first_name: "111",
      last_name: "test",
      email: "tester@example.com",
      password: "password"
    )

    project = user.projects.create(
      name: "Test Project",
    )

    note1 = project.notes.create(
      message: "Test is the first note.",
      user: user,
    )
    note2 = project.notes.create(
      message: "This is the second note.",
      user: user,
    )
    note3 = project.notes.create(
      message: "First, preheat the oven.",
      user: user
    )

    expect(Note.search("first")).to include(note1, note3)
    expect(Note.search("firtt")).to_not include(note2)
  end
end
