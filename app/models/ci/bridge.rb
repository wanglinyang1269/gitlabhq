# frozen_string_literal: true

module Ci
  class Bridge < CommitStatus
    include Ci::Processable
    include Importable
    include AfterCommitQueue
    include HasRef
    include Gitlab::Utils::StrongMemoize

    belongs_to :project
    belongs_to :trigger_request
    validates :ref, presence: true

    def self.retry(bridge, current_user)
      raise NotImplementedError
    end

    def tags
      [:bridge]
    end

    def detailed_status(current_user)
      Gitlab::Ci::Status::Bridge::Factory
        .new(self, current_user)
        .fabricate!
    end

    def schedulable?
      false
    end

    def action?
      false
    end

    def artifacts?
      false
    end

    def expanded_environment_name
    end

    def predefined_variables
      raise NotImplementedError
    end

    def execute_hooks
      raise NotImplementedError
    end

    def to_partial_path
      'projects/generic_commit_statuses/generic_commit_status'
    end
  end
end
