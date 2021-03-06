require "idiot/version"
require "idiot/config"

require 'digest/sha2'

if defined?(Rails)
	require "idiot/railtie"
end

module Idiot
	extend self

	def initialize
		@index = Idiot::Config.alphabet
		pass_key = Idiot::Config.pass_key

		i = @index.split(//)

		passhash = (Digest::SHA2.new << pass_key).to_s
		passhash = if passhash.size < @index.size
			(Digest::SHA2.new(512) << pass_key).to_s
		else
			passhash
		end
		p = passhash.split(//)
		@index = i.zip(p).sort{|x, y| x[1] <=> y[1] }.collect{|x| x[0]}.join

		@base = @index.size
		@pad_up = 5
	end

	def encode(num)
		initialize
		num += @base ** (@pad_up - 1)

		result = ""
		n = Math.log(num, @base).floor

		n.step(0, -1) {|i|
			bcp = @base ** i
			a = ((num / bcp) % @base).floor
			result << @index.slice(a, 1)
			num = num - (a * bcp)
		}

		result.reverse!
	end

	def decode(str)
		initialize
		str.reverse!
		result = 0
		len = str.size - 1
		(0..len).each do |i|
			bcp = @base ** (len - i)
			result += @index.index(str.slice(i, 1)) * bcp
		end

		result -= @base ** (@pad_up - 1)
		result.to_i
	end
end
