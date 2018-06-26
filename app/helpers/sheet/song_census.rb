#  Copyright (c) 2012-2018, Schweizer Blasmusikverband. This file is part of
#  hitobito_sbv and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sbv.

module Sheet
  class SongCensus < Base
    self.parent_sheet = Group

    def title
      SongCensus.model_name.human
    end
  end
end