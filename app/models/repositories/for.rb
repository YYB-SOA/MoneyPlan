
# frozen_string_literal: true

require_relative 'info'
require_relative 'stores'

# module CodePraise
#   module Repository
#     # Finds the right repository for an entity object or class
#     module For
#       ENTITY_REPOSITORY = {
#         Entity::Project => Projects,
#         Entity::Member => Members
#       }.freeze

#       def self.klass(entity_klass)
#         ENTITY_REPOSITORY[entity_klass]
#       end

#       def self.entity(entity_object)
#         ENTITY_REPOSITORY[entity_object.class]
#       end
#     end
#   end
# end