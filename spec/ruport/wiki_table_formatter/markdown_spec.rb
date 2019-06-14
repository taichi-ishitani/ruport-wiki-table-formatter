# frozen_string_literal: true

RSpec.describe Ruport::WikiTableFormatter::Markdown do
  it 'should render a table into Markdown' do
    md = Ruport::Controller::Table.render_markdown do |r|
      r.data = Ruport::Table([:foo, :bar, :baz], data: [[1, 2, 3], [], [4, 5], [6]])
    end
    expect(md).to eq <<~'MD'
      |foo|bar|baz|
      |:--|:--|:--|
      |1|2|3|
      ||||
      |4|5||
      |6|||
    MD
  end

  it 'should replace \'|\' with \'&#124;\'' do
    md = Ruport::Controller::Table.render_markdown do |r|
      r.data = Ruport::Table([:foo], data: [['foo0|foo1']])
    end
    expect(md).to eq <<~'MD'
      |foo|
      |:--|
      |foo0&#124;foo1|
    MD
  end

  it 'should replace newline code (\'\\n\') with \'<br>\' html tag' do
    md = Ruport::Controller::Table.render_markdown do |r|
      r.data = Ruport::Table([:foo], data: [["foo0\nfoo1"]])
    end
    expect(md).to eq <<~'MD'
      |foo|
      |:--|
      |foo0<br>foo1|
    MD
  end

  context 'when column_names is not given' do
    it 'should treat first row as table header' do
      md = Ruport::Controller::Table.render_markdown do |r|
        r.data = Ruport::Table(data: [[:foo, :bar], [1, 2], [3, 4]])
      end
      expect(md).to eq <<~'MD'
        |foo|bar|
        |:--|:--|
        |1|2|
        |3|4|
      MD

      md = Ruport::Controller::Table.render_markdown do |r|
        r.data = Ruport::Table([], data: [[:foo, :bar], [1, 2], [3, 4]])
      end
      expect(md).to eq <<~'MD'
        |foo|bar|
        |:--|:--|
        |1|2|
        |3|4|
      MD
    end
  end

  describe 'options' do
    describe 'alignment option' do
      it 'should specify alignment for all columns' do
        md = Ruport::Controller::Table.render_markdown(alignment: :left) do |r|
          r.data = Ruport::Table([:foo, :bar], data: [[1, 2], [3, 4]])
        end
        expect(md).to eq <<~'MD'
          |foo|bar|
          |:--|:--|
          |1|2|
          |3|4|
        MD

        md = Ruport::Controller::Table.render_markdown(alignment: :center) do |r|
          r.data = Ruport::Table([:foo, :bar], data: [[1, 2], [3, 4]])
        end
        expect(md).to eq <<~'MD'
          |foo|bar|
          |:-:|:-:|
          |1|2|
          |3|4|
        MD

        md = Ruport::Controller::Table.render_markdown(alignment: :right) do |r|
          r.data = Ruport::Table([:foo, :bar], data: [[1, 2], [3, 4]])
        end
        expect(md).to eq <<~'MD'
          |foo|bar|
          |--:|--:|
          |1|2|
          |3|4|
        MD
      end
    end

    describe 'column_alignments option' do
      it 'should specify alignment for specified columns' do
        md = Ruport::Controller::Table.render_markdown(
          column_alignments: { foo: :left, bar: :right, baz: :center }
        ) do |r|
          r.data = Ruport::Table([:foo, :bar, :baz, :qux], data: [[1, 2, 3, 4], [5, 6, 7, 8]])
        end
        expect(md).to eq <<~'MD'
          |foo|bar|baz|qux|
          |:--|--:|:-:|:--|
          |1|2|3|4|
          |5|6|7|8|
        MD
      end
    end

    it 'should override template' do
      Ruport::Formatter::Template.create(:a_template) do |format|
        format.table = {
          alignment: :center,
          column_alignments: { foo: :right }
        }
      end

      md = Ruport::Controller::Table.render_markdown(
        template: :a_template,
        alignment: :right,
        column_alignments: { foo: :left, bar: :center }
      ) do |r|
        r.data = Ruport::Table([:foo, :bar, :baz], data: [[1, 2, 3], [4, 5, 6]])
      end
      expect(md).to eq <<~'MD'
        |foo|bar|baz|
        |:--|:-:|--:|
        |1|2|3|
        |4|5|6|
      MD
    end
  end
end
