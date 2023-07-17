require "avram"
require "postgis"

struct PostGIS::Point2D
  include JSON::Serializable
  @[JSON::Field(key: "x")]
  property x : Float64

  @[JSON::Field(key: "y")]
  property y : Float64

  @[JSON::Field(key: "srid")]
  property srid : UInt32

  def self.adapter
    Lucky
  end

  module Lucky
    alias ColumnType = PostGIS::Point2D
    include Avram::Type

    def self.criteria(query : T, column) forall T
      Criteria(T, Point2D).new(query, column)
    end

    def from_db!(value : PostGIS::Point2D)
      value
    end

    def parse(value : PostGIS::Point2D)
      SuccessfulCast(PostGIS::Point2D).new(value)
    end

    def parse(value : String)
      begin
        point_data = Hash(String, (UInt32 | Float64)).from_json(value)
        x = point_data["x"].as(Float64)
        y = point_data["y"].as(Float64)
        srid = point_data["srid"].as(UInt32)
        point = PostGIS::Point2D.new(x, y, srid)
        SuccessfulCast(PostGIS::Point2D).new(point)
      rescue
        FailedCast.new
      end
    end

    def to_db(value : PostGIS::Point2D)
      "POINT (#{value.x} #{value.y})"
    end

    class Criteria(T, V) < Avram::Criteria(T, V)
      include Avram::IncludesCriteria(T, V)
    end
  end
end
