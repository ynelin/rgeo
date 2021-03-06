# -----------------------------------------------------------------------------
#
# Tests for OGC CS classes
#
# -----------------------------------------------------------------------------

require 'test/unit'
require 'rgeo'


module RGeo
  module Tests  # :nodoc:
    module CoordSys  # :nodoc:

      class TestSrOrg < ::Test::Unit::TestCase  # :nodoc:


        def test_epsg_4326
          db_ = ::RGeo::CoordSys::SRSDatabase::SrOrg.new('epsg')
          entry_ = db_.get(4326)
          assert_equal('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs', entry_.proj4.original_str)
          assert_kind_of(::RGeo::CoordSys::CS::GeographicCoordinateSystem, entry_.coord_sys)
          assert_equal('WGS 84', entry_.name)
        end


        def test_epsg_3857
          db_ = ::RGeo::CoordSys::SRSDatabase::SrOrg.new('epsg')
          entry_ = db_.get(3857)
          assert_equal('+proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +a=6378137 +b=6378137 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs', entry_.proj4.original_str)
          assert_kind_of(::RGeo::CoordSys::CS::ProjectedCoordinateSystem, entry_.coord_sys)
          assert_equal('Popular Visualisation CRS / Mercator', entry_.name)
        end


      end if false

    end
  end
end
