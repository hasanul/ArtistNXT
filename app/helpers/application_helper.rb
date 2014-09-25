module ApplicationHelper
  
  def sortColumn(sorting_column, sort_by, sort_dir, column_header)
    
    html = ''
    
    if sorting_column == sort_by
        if sort_dir == 'asc'
          html += '<a title="Click to sort by this column" onclick="tableOrdering(\'' + sorting_column + '\', \'desc\');return false;" href="#">'
          html += column_header + '&nbsp;' + image_tag("/assets/sort_asc.png")
        elsif sort_dir == 'desc'
          html += '<a title="Click to sort by this column" onclick="tableOrdering(\'' + sorting_column + '\', \'asc\');return false;" href="#">'
          html += column_header + '&nbsp;' + image_tag("/assets/sort_desc.png")
        else
          html += '<a title="Click to sort by this column" onclick="tableOrdering(\'' + sorting_column + '\', \'asc\');return false;" href="#">'
          html += column_header
        end
    else
        html += '<a title="Click to sort by this column" onclick="tableOrdering(\'' + sorting_column + '\', \'desc\');return false;" href="#">'
        html += column_header + '&nbsp;' + image_tag("/assets/sort_asc.png")
    end
    
    html += '</a>'
    
    return html
  end
end
