class IssueEntity < IssuableEntity
  expose :branch_name
  expose :confidential
  expose :assignees
  expose :due_date
  expose :moved_to_id
  expose :project_id
  expose :weight
  expose :milestone, using: API::Entities::Milestone
  expose :labels, using: LabelEntity
end
