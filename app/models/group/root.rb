# encoding: utf-8

#  Copyright (c) 2012-2018, Schweizer Blasmusikverband. This file is part of
#  hitobito_sbv and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sbv.

# == Schema Information
#
# Table name: groups
#
#  id                          :integer          not null, primary key
#  parent_id                   :integer
#  lft                         :integer
#  rgt                         :integer
#  name                        :string(255)      not null
#  short_name                  :string(31)
#  type                        :string(255)      not null
#  email                       :string(255)
#  address                     :string(1024)
#  zip_code                    :integer
#  town                        :string(255)
#  country                     :string(255)
#  contact_id                  :integer
#  created_at                  :datetime
#  updated_at                  :datetime
#  deleted_at                  :datetime
#  layer_group_id              :integer
#  creator_id                  :integer
#  updater_id                  :integer
#  deleter_id                  :integer
#  require_person_add_requests :boolean          default(FALSE), not null
#  vereinssitz                 :string(255)
#  founding_year               :integer
#  correspondence_language     :string(5)
#  besetzung                   :string(255)
#  klasse                      :string(255)
#  unterhaltungsmusik          :string(255)
#  subventionen                :string(255)
#  reported_members            :integer
#  song_census_completed       :boolean          default(FALSE), not null
#


#  Copyright (c) 2012-2018, Schweizer Blasmusikverband. This file is part of
#  hitobito_sbv and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sbv.

class Group::Root < ::Group

  self.layer = true
  self.default_children = [Group::RootGeschaeftsstelle,
                           Group::RootVorstand,
                           Group::RootMusikkommission,
                           Group::RootKontakte,
                           Group::RootEhrenmitglieder,
                           Group::RootVeteranen]

  self.event_types = [Event, Event::Course]

  children Group::RootGeschaeftsstelle,
           Group::RootVorstand,
           Group::RootMusikkommission,
           Group::RootArbeitsgruppe,
           Group::RootKontakte,
           Group::RootEhrenmitglieder,
           Group::RootVeteranen,
           Group::Mitgliederverband,
           Group::Verein

  ### ROLES

  class Admin < Role::Admin
    self.permissions = [:layer_and_below_full, :admin, :impersonation, :finance]
  end

  class SuisaAdmin < Role
  end

  roles Admin, SuisaAdmin

end
