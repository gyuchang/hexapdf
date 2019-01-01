# -*- encoding: utf-8; frozen_string_literal: true -*-
#
#--
# This file is part of HexaPDF.
#
# HexaPDF - A Versatile PDF Creation and Manipulation Library For Ruby
# Copyright (C) 2014-2019 Thomas Leitner
#
# HexaPDF is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License version 3 as
# published by the Free Software Foundation with the addition of the
# following permission added to Section 15 as permitted in Section 7(a):
# FOR ANY PART OF THE COVERED WORK IN WHICH THE COPYRIGHT IS OWNED BY
# THOMAS LEITNER, THOMAS LEITNER DISCLAIMS THE WARRANTY OF NON
# INFRINGEMENT OF THIRD PARTY RIGHTS.
#
# HexaPDF is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with HexaPDF. If not, see <http://www.gnu.org/licenses/>.
#
# The interactive user interfaces in modified source and object code
# versions of HexaPDF must display Appropriate Legal Notices, as required
# under Section 5 of the GNU Affero General Public License version 3.
#
# In accordance with Section 7(b) of the GNU Affero General Public
# License, a covered work must retain the producer line in every PDF that
# is created or manipulated using HexaPDF.
#
# If the GNU Affero General Public License doesn't fit your need,
# commercial licenses are available at <https://gettalong.at/hexapdf/>.
#++

module HexaPDF

  # A general error.
  class Error < StandardError; end

  # Raised when the PDF is invalid and can't be read correctly.
  class MalformedPDFError < Error

    # The byte position in the PDF file where the error occured.
    attr_reader :pos

    # Creates a new malformed PDF error object for the given exception message.
    #
    # The byte position where the error occured has to be given via the +pos+ argument.
    def initialize(message, pos:)
      super(message)
      @pos = pos
    end

    def message # :nodoc:
      "PDF malformed around position #{pos}: #{super}"
    end

  end

  # Raised when a filter encounters a problem during decoding or encoding.
  class FilterError < Error; end

  # Raised when a PDF object contains invalid data.
  class InvalidPDFObjectError < Error; end

  # Raised when there are problems while encrypting or decrypting a document.
  class EncryptionError < Error; end

  # Raised when the encryption method is not supported.
  class UnsupportedEncryptionError < EncryptionError; end

end
