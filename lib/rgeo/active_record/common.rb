# -----------------------------------------------------------------------------
# 
# Common tools for spatial adapters for ActiveRecord
# 
# -----------------------------------------------------------------------------
# Copyright 2010 Daniel Azuma
# 
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the copyright holder, nor the names of any other
#   contributors to this software, may be used to endorse or promote products
#   derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# -----------------------------------------------------------------------------
;


require 'rgeo/feature'
require 'rgeo/cartesian'
require 'rgeo/geography'


module RGeo
  
  module ActiveRecord
    
    GEOMETRY_TYPES = [:geometry, :point, :line_string, :polygon, :geometry_collection, :multi_line_string, :multi_point, :multi_polygon]
    
    module Common  # :nodoc:
      
      class IndexDefinition < ::Struct.new(:table, :name, :unique, :columns, :lengths, :spatial)  # :nodoc:
      end
      
      class << self
        
        def geometric_type_from_name(name_)
          case name_.downcase
          when 'geometry' then ::RGeo::Feature::Geometry
          when 'point' then ::RGeo::Feature::Point
          when 'linestring' then ::RGeo::Feature::LineString
          when 'polygon' then ::RGeo::Feature::Polygon
          when 'geometrycollection' then ::RGeo::Feature::GeometryCollection
          when 'multipoint' then ::RGeo::Feature::MultiPoint
          when 'multilinestring' then ::RGeo::Feature::MultiLineString
          when 'multipolygon' then ::RGeo::Feature::MultiPolygon
          else nil
          end
        end
        
      end
      
    end
    
  end
  
end


require 'rgeo/active_record/arel_modifications'
require 'rgeo/active_record/base_modifications'