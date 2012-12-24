#!/bin/bash
# Copyright (c) 2012 SnowPlow Analytics Ltd. All rights reserved.
#
# This program is licensed to you under the Apache License Version
# 2.0,
# and you may not use this file except in compliance with the Apache
# License Version 2.0.
# You may obtain a copy of the Apache License Version 2.0 at
# http://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the Apache License Version 2.0 is
# distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied.
# See the Apache License Version 2.0 for the specific language
# governing permissions and limitations there under.

# Author::    Alex Dean (mailto:support@snowplowanalytics.com)
# Copyright:: Copyright (c) 2012 SnowPlow Analytics Ltd
# License::   Apache License Version 2.0

# Sync the main search_engines.yml with the dependent ones in the
# sub-folders

# Source path
YML=search.yml

# Target paths
RUBY="./ruby/data/${YML}"
JAVA="./java-scala/src/main/resources/${YML}"
PYTHON="./python/referer_parser/data/${YML}"

# Sync the file
sync_to(){
  echo "#################################### DO NOT EDIT THIS FILE ####################################
#                                                                                             #  
#             This file will be overwritten the next time ./sync_yaml.sh is run!              #
#                                                                                             #
#################################### DO NOT EDIT THIS FILE ####################################
" | cat - ./${YML} > ${1}
}

# Ruby, Java/Scala
sync_to ${RUBY}
sync_to ${JAVA}
# Add others
sync_to ${PYTHON}

# Finally commit on current branch
git commit ${RUBY} ${JAVA} ${PYTHON} -m "Updated ${YML} in sub-folders following updates to master copy"
python -c "import yaml, json;yaml"
