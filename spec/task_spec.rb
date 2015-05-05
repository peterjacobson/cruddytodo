require_relative 'spec_helper'
require_relative './../app/models/task'

describe 'Task' do
  # let(:task) { Task.create({description: description}) }
  context "Create" do
    let(:description) { 'my first task' }
    let(:valid_task) { Task.create({description: description}) }

    # it "throws error if no description added" do
    #   expect(Task.create).to raise_error(StatementInvalid)
    # end

    it "saves a valid task" do
      expect(Task.find_by_description(valid_task.description)).not_to be nil
    end

    it "has complete? set to false by default" do
      expect(Task.find_by_description(valid_task.description).complete?).to be false
    end

    it "has priority set to 'c' by default" do
      expect(Task.find_by_description(valid_task.description).priority).to eq('c')
    end

  end
end
