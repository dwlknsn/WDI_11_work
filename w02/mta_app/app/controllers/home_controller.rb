class HomeController < ApplicationController
	def home
    @mta = {
      n: ['ts', '34th', '28th-n', '23rd-n', 'us', '8th-n'],
      l: ['8th-l', '6th', 'us', '3rd', '1st'],
      s: ['gc', '33rd', '28th-s', '23rd-s', 'us', 'ap']
    }

    if params[:start_train]
      start_train = params[:start_train].to_sym
      stop_a = params[:start_stop]
      stop_train = params[:end_train].to_sym
      stop_b = params[:end_stop]

      if start_train != stop_train
        intersection = (@mta[start_train] & @mta[stop_train]).first

        stop_a_index = @mta[start_train].index(stop_a)
        stop_a_intersection_index = @mta[start_train].index(intersection)
        trip_a_length = (stop_a_index - stop_a_intersection_index).abs

        stop_b_index = @mta[stop_train].index(stop_b)
        stop_b_intersection_index = @mta[stop_train].index(intersection)
        trip_b_length = (stop_b_index - stop_b_intersection_index).abs

        @total_length_of_trip = trip_a_length + trip_b_length
      else
        stop_a_index = @mta[start_train].index(stop_a)
        stop_b_index = @mta[stop_train].index(stop_b)
        @total_length_of_trip = (stop_a_index - stop_b_index).abs
      end

    end

	end
end